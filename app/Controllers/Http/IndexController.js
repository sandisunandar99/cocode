'use strict'

const User = use('App/Models/User')
const Logger = use('Logger')


class IndexController {

    async index({view, auth}){

        const id = auth.user.id
        const users = await User.find(id)
        const roles = await users.getRoles()
        // console.log(users)
        // console.log(roles)
        return view.render('index.home')
    }


    async userStore({auth, response}){
      const id = auth.user.id
      const users = await User.find(id)
      const roles = await users.getRoles()

      // console.log(users);
      const res = {
        user_id : users.id,
        user_uname : users.username,
        user_roles : roles,
        user_avatar : users.avatar
      }

      response.header('Content-type', 'application/json')
      response.status(200).send(res)
    }


    async error403({view}){

        const user = await User.first()

        return view.render('error.403',{users : user.rows} )
    }


}

module.exports = IndexController
