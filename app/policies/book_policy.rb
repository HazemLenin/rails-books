class BookPolicy < ApplicationPolicy
    def new?
        user.has_role?(:admin) || record.user_id == user.id
    end

    def edit?
        user.has_role?(:admin) || record.user_id == user.id
    end

    def create?
        user.has_role?(:admin) || record.user_id == user.id
    end

    def update?
        user.has_role?(:admin) || record.user_id == user.id
    end

    def destroy?
        user.has_role?(:admin) || record.user_id == user.id
    end
end