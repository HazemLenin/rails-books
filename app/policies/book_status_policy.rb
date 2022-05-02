class BookStatusPolicy < ApplicationPolicy
    def index?
        @user.has_role?(:reader)
    end
    
    def new?
        @user.has_role?(:reader)
    end

    def edit?
        @user.has_role?(:reader)
    end

    def create?
        @user.has_role?(:reader)
    end

    def update?
        @user.has_role?(:reader)
    end

    def destroy?
        @user.has_role?(:reader)
    end
end