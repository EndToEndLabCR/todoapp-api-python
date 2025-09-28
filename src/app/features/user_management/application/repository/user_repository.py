from abc import abstractmethod
from typing import Optional, AsyncIterator

from src.app.features.user_management.domain.entities.user_enums import UserRole, UserStatus
from src.app.features.user_management.domain.entities.user_entity import UserEntity
from src.app.features.user_management.domain.value_objects.email import Email
from src.app.features.user_management.domain.value_objects.user_id import UserId
from src.shared.domain.repositories.base_repository import BaseRepository

class UserRepository(BaseRepository[UserEntity, UserId]):
    """User repository interface"""

    @abstractmethod
    async def find_by_email(self, email: Email) -> Optional[UserEntity]:
        pass

    @abstractmethod
    async def find_by_role(self, user_role: UserRole, limit: Optional[int] = None, offset: Optional[int] = None) -> AsyncIterator[UserEntity]:
        pass

    @abstractmethod
    async def find_by_status(self, status: UserStatus, limit: Optional[int] = None, offset: Optional[int] = None) -> AsyncIterator[UserEntity]:
        pass

    @abstractmethod
    async def email_exists(self, email: Email, exclude_id: Optional[UserId] = None) -> bool:
        pass
