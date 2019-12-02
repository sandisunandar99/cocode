'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */


const Model = use('Model')
const Database = use('Database')

class Admin extends Model {

  async userview(req){
    const data = await Database
        .select('id','username','fullname','email','hp','address','lat','long','avatar')
        .from('users')
        .where('id',req)
        return data
  }

  async rolePermission(req){
    const data = await Database
        .select('*')
        .from('v_user_role_permission')
        .where('user_id',req)
        return data;
  }

  async permission(req){
    const data = await Database
        .select('*')
        .from('v_user_permission')
        .where('user_id',req)
        return data
  }


  async roles(req) {
    const data = await Database
        .select('*')
        .from('v_user_role')
        .where('user_id',req)
        return data
  }


}

module.exports = Admin
