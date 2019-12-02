'use strict'


const Task  = use('App/Models/Task')
const {validate} = use('Validator')


class TaskController {

    async index({view}){

        const tasks = await Task.all()

        return view.render('tasks.index', {tasks: tasks.toJSON()})
    }//end


    async store({request, response, session}){

        //validasi from input
        const validation = await validate(request.all(),{
            title: 'required|min:3|max:255'
        })

        // show error message upon validate fail
        if (validation.fails()) {
            session.withErrors(validation.message())
                .flashAll()
            return response.redirect('back')
        }

        // persist to database
        const task = new Task()
        task.title = request.input('title')
        await task.save()


        // flash success message to session
        session.flash({notification: 'Task added!'})

        return response.redirect('back')
    }//end


    async destroy({params,session, response }){
        const task = await Task.find(params.id)
        await task.delete()

          // Fash success message to session
        session.flash({ notification: 'Task deleted!' })

        return response.redirect('back')
    }//end


    async update({params, request, response}){

        const tasks = new Task()
        const title = request.input('title')

        let task = await Task.find(params.id)

        task.title = title

        await task.save()

        return response.redirect('back', {tasks: tasks.toJSON()})
    }//end


}

module.exports = TaskController
