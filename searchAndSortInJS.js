// Function to search for books
function linearSearchBooks(searchTerm, searchBy) {
    const results = [];

    // Convert the search term to lowercase for case-insensitive search
    const searchTermLower = searchTerm.toLowerCase();

    // Iterate through the books array
    for (let i = 0; i < books.length; i++) {
        const book = books[i];

        // Check if the search term matches the book's title, author, or ISBN number
        if (
            book.title.toLowerCase().includes(searchTermLower) &&
            (searchBy === "title" ||
                searchBy === "author" ||
                searchBy === "isbn") ||
            book.author.toLowerCase().includes(searchTermLower) &&
            (searchBy === "title" || searchBy === "author") ||
            book.isbn.includes(searchTerm) &&
            searchBy === "isbn"
        ) {
            results.push(book);
        }
    }

    return results;
}

// Function to sort books by publication year using insertion sort
function sortBooksByPublicationYear() {
    for (let i = 1; i < books.length; i++) {
        const currentBook = books[i];
        let j = i - 1;

        while (j >= 0 && books[j].publicationYear > currentBook.publicationYear) {
            books[j + 1] = books[j];
            j--;
        }

        books[j + 1] = currentBook;
    }
}

// Function to sort books by author using selection sort
function sortBooksByAuthor() {
    for (let i = 0; i < books.length - 1; i++) {
        let minIndex = i;

        for (let j = i + 1; j < books.length; j++) {
            if (books[j].author < books[minIndex].author) {
                minIndex = j;
            }
        }

        if (minIndex !== i) {
            const temp = books[i];
            books[i] = books[minIndex];
            books[minIndex] = temp;
        }
    }
}