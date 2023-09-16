from rest_framework import serializers
from library_app.models import CustomUser
from library_app.models import Book, Borrow

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
        model = Borrow
        fields = ('id', 'borrowed_date', 'return_date', 'quantity_borrowed', 'book')

    def get_book(self, obj):
        book = obj.book
        return {
            'title': book.title,
            'author': book.author,
            'isbn': book.isbn, 
        }
