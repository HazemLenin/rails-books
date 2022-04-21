class BookPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            if @user.has_role?(:author)
                scope.where(user: @user)
            end
        end
    end
    def new?
        @user.has_role?(:admin) || @user.has_role?(:author)
    end

    def edit?
        @user.has_role?(:admin) || @record.user == @user
    end

    def create?
        @user.has_role?(:admin) || @user.has_role?(:author)
    end

    def update?
        @user.has_role?(:admin) || @record.user == @user
    end

    def destroy?
        @user.has_role?(:admin) || @record.user == @user
    end
end