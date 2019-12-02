'use strict'

/*
|--------------------------------------------------------------------------
| CreateUserSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

class CreateUserSeeder {
  async run () {
    // const user = await Factory.model('App/Models/User').create({
    //   username: 'user1',
    //   email: 'user1@user1.com',
    //   password: 'user123',
    // })
    //
    // await user.roles().attach(2)
  }
}

module.exports = CreateUserSeeder
