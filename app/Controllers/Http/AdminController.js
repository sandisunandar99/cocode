'use strict'

// const Config = use('Config')
const Helpers = use('Helpers')

const Database  = use('Database')
const Logger = use('Logger')
const User = use('App/Models/User')
const Admin= use('App/Models/Admin')
const Roles= use('Adonis/Acl/Role')
const Permission= use('Adonis/Acl/Permission')
const { validate } = use('Validator')


class AdminController {

    async index({view}){
       const users = await User.all()
      // console.log(users.rows[1].email);
       return view.render('admin.index',{users : users.rows})
    }

    async adduser({view}){

      return view.render('admin.adduser');
    }

    /**
     * 
     * TODO: add role belum 
     * FIXME:
     */
    async addrole({view}){
      const getRole = await Roles.all()
      
      return view.render('admin.addrole', {roles: getRole.rows});
    }

    /**
     * 
     * TODO: add permission belum
     * FIXME:
     */
    async addpermission({view}){
      const getPermission = await Permission.all()

      return view.render('admin.addpermission',{permissions: getPermission.rows});
    }

    async UserView({request, response}){

        const admin = new Admin()

        const userid = request.params.id

        const u_user = await admin.userview(userid)
        const u_role_permission = await admin.rolePermission(userid)
        const u_permission = await admin.permission(userid)
        const u_roles = await admin.roles(userid)        

        const datax = {
            user : u_user,
            role_permission : u_role_permission,
            permission : u_permission,
            roles : u_roles
        }

        const res = {
          status : "success",
          message : "data success",
          data : datax
        }


        response.header('Content-type', 'application/json')
        response.status(200).send(res)
    }

    async getRoles({response}){
        const getRole = await Roles.all()
        response.header('Content-type', 'application/json')
        response.status(200).send(getRole)
    }

    async userSave({request, response, session}){

      const data = request.only(['username', 'email', 'password', 'fullname','hp','addr','roles'])

      const rules = {
        username : 'required|min:5|max:15',
        email: 'required|email|unique:users,email',
        password: 'required|min:6|max:255'
      }
      const validation = await validate(data, rules)


      if (validation.fails()) {
        session
          .withErrors(validation.messages())
          .flashExcept(['password','_csrf'])
          .flash({error: 'error : '+validation._errorMessages[0].message})
        return response.redirect('back')
      }


      const ImgValiation = {
        types: ['image'],
        size: '2mb',
        extnames: ['png', 'jpg']
      }

      const files = request.file('files',ImgValiation)

      // console.log(files)
      
      if (files != null) {
        await files.move(Helpers.publicPath('img/avatar'),{
          // name: ''+data.username+'_'+Date.now()+'.jpg',
          overwrite: true
        })  

        if (!files.moved()) {
          session.flash({error: 'error : '+files.error()})
        }
      } 


      const users = new User()
      users.username = data.username
      users.email = data.email
      users.password = data.password
      users.fullname = data.fullname
      users.hp = data.hp
      users.address = data.addr
      if (files != null) {
        users.avatar = files.clientName  
      }else{
        users.avatar = null
      }
      await users.save()

      const getID = await Database.from('users').getMax('id')
      const user_role = await User.find(getID)
      await user_role.roles().attach(data.roles)


      session.flash({success: 'User has been added!'})
      return response.redirect('back')

    }

    async userDelete({request,session, response }){
      const users = await User.find(request._all.id)
      // console.log(request._all);
      await users.delete()

      session.flash({ delete: 'User '+request._all.uname+' deleted!' })

      return response.redirect('back')
    }


    async updateUser({ request, response, session }) {

      const data = request.only(['user_id','username', 'email', 'password', 'fullname', 'hp', 'addr', 'roles','roles_e','avatar'])

      // console.log(data)

      const ImgValiation = {
        types: ['image'],
        size: '2mb',
        extnames: ['png', 'jpg']
      }

      const files = request.file('filex', ImgValiation)

      if (files != null) {
        await files.move(Helpers.publicPath('img/avatar'), {
          // name: ''+data.username+'_'+Date.now()+'.jpg',
          overwrite: true
        })

        if (!files.moved()) {
          session.flash({ error: 'error : ' + files.error() })
        }
      }

      // const users = new User()
      // const admin = new Admin()
      const user_id = parseInt(data.user_id) 

      const users = await User.find(user_id)  
      
      users.username = data.username
      users.email = data.email
      users.password = data.password
      users.fullname = data.fullname
      users.hp = data.hp
      users.address = data.addr
      if (files != null) {
        users.avatar = files.clientName
      } else {
        users.avatar = data.avatar
      }
      
      await users.save()

      await users.roles().detach(data.roles_e)
      await users.roles().attach(data.roles)      

      
      session.flash({ success: 'User has been updated!' })
      return response.redirect('back')

    }


}

module.exports = AdminController
