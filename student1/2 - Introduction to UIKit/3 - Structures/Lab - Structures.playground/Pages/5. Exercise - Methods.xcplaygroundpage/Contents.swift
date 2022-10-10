/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() {
        print("Book: \(title), Author: \(author), Page Amount: \(pages), Price: \(price)")
    }
}

var readDesc = Book(title: "The Maze Runner", author: "James Dashner", pages: 150, price: 5.00)
readDesc.description()

//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    var message: String = ""
    var likes: Int = 0
    var numberOfComments: Int = 0
    
    mutating func like() {
        likes += 1
    }
}

var likePost = Post(message: "hello guys", likes: 12, numberOfComments: 5)

print(likePost.likes)
likePost.like()
print(likePost.likes)
/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */
