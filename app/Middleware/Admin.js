'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const User = use('App/Models/User')
const Role = use('Adonis/Acl/Role')
const Permission= use('Adonis/Acl/Permission')
const Adm= use('App/Models/Admin')

class Admin {
  /**
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Function} next
   */
  async handle ({ request, response, auth }, next) {
    // call next to advance the request

    const id = auth.user.id
    const users = await User.find(id)
    const roles = await users.getRoles()

    const behaviors = ["administrator", "moderator"]
    
    if (behaviors.includes(roles.toString())) {
      await next()
    } else {
      return response.redirect('/403', 403)
    }
        
  }
}

module.exports = Admin
