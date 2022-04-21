# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([{
    username: "admin",
    email: "admin@example.com",
    first_name: "admin",
    last_name: "of rails books",
    password: "helloworld"
}])

User.find(1).add_role(:reader)
User.find(1).add_role(:author)
User.find(1).add_role(:admin)

10.times do |i|
    Book.create!([{
        user_id: 1,
        title: "Book #{i}",
        publication_date: "2022-3-3",
        description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
        molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
        numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
        optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
        obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
        nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
        tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,
        quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos 
        sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam
        recusandae alias error harum maxime adipisci amet laborum.",
        chapters: 20,
        page_count: 150,
    }])
end

["want to read", "reading", "read"].each do |status|
    Status.create!([{
        title: status,
    }])
end