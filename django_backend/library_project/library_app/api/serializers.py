from rest_framework import serializers
from library_app.models import CustomUser
from library_app.models import Book, Borrow,Favorite

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = "__all__"
        

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = '__all__'

class BorrowedBookSerializer(serializers.ModelSerializer):
    book = serializers.SerializerMethodField()

    class Meta:
        model = Favorite
        fields = ('book',)

    def get_book(self, obj):
        book = obj.book
        return {
            'id' : book.id,
            'title': book.title,
            'author': book.author,
            'cover_image': book.cover_image.url,
            'isbn': book.isbn, 
        }


class FavoritedBookSerializer(serializers.ModelSerializer):
    book = serializers.SerializerMethodField()

    class Meta:
        model = Favorite
        fields = ('book',)

    def get_book(self, obj):
        book = obj.book
        return {
            'id' : book.id,
            'title': book.title,
            'author': book.author,
            'cover_image': book.cover_image.url,
            'isbn': book.isbn, 
        }