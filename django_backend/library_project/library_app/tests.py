from django.test import TestCase
from django.contrib.auth import get_user_model
from .models import Book, Favorite

User = get_user_model()

# Test case for the CustomUser model
class CustomUserModelTest(TestCase):
    def test_create_user(self):
        # Create a regular user
        user = User.objects.create_user(
            user_name='testuser',
            email='test@example.com',
            password='password123',
            first_name='John',
            last_name='Doe'
        )
        # Check user attributes
        self.assertEqual(user.user_name, 'testuser')
        self.assertEqual(user.email, 'test@example.com')
        self.assertTrue(user.check_password('password123'))

    def test_create_superuser(self):
        # Create a superuser
        admin_user = User.objects.create_superuser(
            user_name='adminuser',
            email='admin@example.com',
            password='admin123'
        )
        # Check superuser attributes
        self.assertTrue(admin_user.is_superuser)
        self.assertTrue(admin_user.is_staff)

# Test case for the Book model
class BookModelTest(TestCase):
    def test_create_book(self):
        # Create a book
        book = Book.objects.create(
            title='Test Book',
            author='Test Author',
            isbn='1234567890123',
            quantity=5
        )
        # Check book attributes
        self.assertEqual(book.title, 'Test Book')
        self.assertEqual(book.author, 'Test Author')
        self.assertEqual(book.isbn, '1234567890123')
        self.assertEqual(book.quantity, 5)

# Test case for the Favorite model
class FavoriteModelTest(TestCase):
    def setUp(self):
        # Create a user and a book for testing favorites
        self.user = User.objects.create_user(
            user_name='testuser',
            email='test@example.com',
            password='password123',
            first_name='John',
            last_name='Doe'
        )
        self.book = Book.objects.create(
            title='Test Book',
            author='Test Author',
            isbn='1234567890123',
            quantity=5
        )

    def test_create_favorite(self):
        # Create a favorite
        favorite = Favorite.objects.create(
            user=self.user,
            book=self.book
        )
        # Check favorite associations
        self.assertEqual(favorite.user, self.user)
        self.assertEqual(favorite.book, self.book)
