'use strict'
/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const User = use('App/Models/User')

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

    // console.log(roles.indexOf('administrator'));

    if (roles.indexOf('administrator') != -1) {
      // jika admin maka bisa masuk ke menu2 admin
    } else {
      return response.redirect('403', 403)
    }

    await next()
  }
}

module.exports = Admin
