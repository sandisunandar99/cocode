'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class AlterUsersSchema extends Schema {
  up () {
    this.alter('users', (table) => {
      table.string('fullname')
      table.string('hp')
      table.text('address')
      table.string('lat')
      table.string('long')
      table.text('avatar')
    })

  }

  down () {
    this.drop('users')
  }
}

module.exports = AlterUsersSchema
