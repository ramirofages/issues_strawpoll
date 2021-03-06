class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new



    if user.persisted?
        can [:read, :update, :create, :destroy, :new], Project

        can [:create_source, :new_source], Project do |project|
            project.project_source.nil?
        end

        can :mocked_source_actions, Project do |project|
            project.project_source.class == MockedSource
        end
        can :github_source_actions, Project do |project|
            project.project_source.class == GithubSource
        end

        can :read, Poll 
        
        can [:update, :create, :destroy, :enable_disable], Poll do |poll|
            poll.project.user_id == user.id and not poll.project.project_source.nil?
        end

        can :vote, Poll do |poll| 
            poll.accept_votes? and not poll.votes.any? do |vote|
                vote.user_id == user.id
            end
        end
    else
        can :read, Project, :public => true
        can :read, Poll, :project => { :public => true }
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
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
