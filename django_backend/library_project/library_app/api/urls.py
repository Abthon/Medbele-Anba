from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from .views import (
    APIEndpoints,
    Register,
    UserList,
    UserProfile,
    BorrowBookView,
    BookList,
    BookDetail,
    BorrowedBooksList
)

urlpatterns = [
    #App related Endpoints
    path('', APIEndpoints.as_view(), name='home'),
    path('borrow/<int:book_id>/', BorrowBookView.as_view(), name='borrow-book'),
    path('books/', BookList.as_view(), name='books'),
    path('book/<int:book_id>/', BookDetail.as_view(), name='book-detail'),
    path('borrowed-books/', BorrowedBooksList.as_view(), name='borrowed-books'),
    
    #User related Endpoints
    path('users/', UserList.as_view(), name='users'),
    path('user/profile/', UserProfile.as_view(), name='user_profile'),
    
    #Authentication Endpoints
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('register/', Register.as_view(), name='register'),
    
]