'use strict'

const Database  = use('Database')
const Config = use('Config')

const User = use('App/Models/User')
const Admin= use('App/Models/Admin')

const Role= use('Adonis/Acl/Role')
const Permission= use('Adonis/Acl/Permission')


class TestController {


  async multipleconnection({response, request}){
    // console.log(request.params.id)
    try {
      Database.connection('mysql2');
      console.log("connected")
      console.log(Database.connection('mysql2').table('users'))
      } catch (errors) {
      console.log(errors)
      }


    return await Database
        .connection('mysql2')
        .table('users')
        .where(request.params)
  }


  async joindata({response,request}){

      return Database
      .table('users')
      .on('query',console.log)
  }


  async cekdata({response, request}){
    const admin = new Admin()

    const param  = {
        data: 'user role permission',
        message: 'success'
    }

    const userrolepermission = await admin.userRolePermission(param)

    return userrolepermission;
  }


  async cekresponse({response}){
      const user = new User()

      const usx = await User.all()

      // return usx
      // response.send(usx)
      response.header('Content-type', 'application/json')
      response.json(usx)
  }


}

module.exports = TestController
