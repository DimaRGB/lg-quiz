jQuery ->
  app.checkUserRole()


class window.App extends Backbone.Model
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  router: null
  user: null

  checkUserRole: (options) ->
    @user = new app.Models.CurrentUser
    @user
      .fetch
        success: =>
          if @user.get('role') == 'admin'
            @router = new @Routers.Admin
            (new app.Views.AdminMenu).render().show()
          else
            if @user.get('surveyed')
              @router = new @Routers.User
            else
              @router = new @Routers.NewUser
            (new app.Views.UserMenu).render().show()
        error: =>
          @router = new @Routers.Guest
          (new app.Views.GuestMenu).render().show()
      .always =>
        if options && options.redirect
          @router.navigateReplace '#/'
        Backbone.history.stop()
        Backbone.history.start()


window.app = new App
