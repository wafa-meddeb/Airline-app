import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: 

      SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Padding(
             padding: const EdgeInsets.all(35),
             child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow:const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(5, 5),
                    blurRadius: 20,
                  )
                ],
              ),
              child: const Icon(Icons.person, size: 100, color: Colors.grey,),
                     ),
           ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
                   decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'First name *',
                ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
                     decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Family name *',
                  ),
                    ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
                     decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'email address *',
                  ),
                    ),
          ),
             Padding(
               padding: const EdgeInsets.all(12),
               child: TextFormField(
                       decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'password *',
                    ),
                      ),
             ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
                     decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Phone number',
                  ),
                    ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
                     decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'passport number *',
                  ),
                    ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Edit Profile"),
                ),
              ),
            ),
          )
         
        ],
      ),
      ),
      
      

      
    );
  }
}