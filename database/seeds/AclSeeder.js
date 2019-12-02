'use strict'

/*
|--------------------------------------------------------------------------
| AclSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

const Role = use('Adonis/Acl/Role')
const Permission = use('Adonis/Acl/Permission')
const User = use('App/Models/User')


class AclSeeder {
  async run () {
      // const user = await User.find(1)
      // await user.permissions().attach([2,4])
      // await user.roles().attach([3])
  }
}

module.exports = AclSeeder
