class Ability
  include CanCan::Ability

  def initialize(usuario)
    usuario ||= Usuario.new # guest user
    if usuario.new_record?
      usuario.rol = "Guest"
    end
    
    if usuario.admin?
      can :manage, :all
    elsif usuario.usuario?
      # profesores
      can [:read, :create], Profesor
      
      # universidades
      can :read, Universidad
      
      # campus
      can :read, Campus
      
      # cursos
      can [:read, :create], Curso
      
      # comentarios
      can [:read, :create], Comentario
      
      # calificaciones
      can [:read, :create, :like], Calificacion
      
      can [:edit_current_usuario], Usuario
      
    else
      # usuarios
      can :create, Usuario
      
      can :read, [Profesor, Universidad, Campus, Curso, Comentario, Calificacion]
      
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
