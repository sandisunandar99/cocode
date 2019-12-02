'use strict'

const User = use('App/Models/User')

class SessionController {

    async login({view, auth, response}){

      if(auth.user){
        response.redirect('/')
      }

      return view.render('auth/login')
    }

    async store({auth, response, request, session}){
        const {username, password} = request.all()
        
        try {
            await auth.attempt(username, password)
        } catch (e) {
            console.log(e);
            
            session.flashExcept(['password'])

            session.flash({error : 'Credentian error, username or password wrong!'})

            return response.redirect('login')
        }

        return response.redirect('/')
    }

    async logout({auth, response}){
        await auth.logout()

        return response.redirect('login')
    }


}

module.exports = SessionController
