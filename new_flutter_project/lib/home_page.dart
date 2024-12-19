import 'package:flutter/material.dart';
import 'package:new_flutter_project/second_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static const homepageRoute = '/homepage';

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Hours'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Image.network(
                'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Text(
                'Tv Series',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SecondPage.secondPageRoute,
                          arguments: i);
                    },
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              images[i],
                            ),
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, i) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            images[i],
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, i) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            images[i],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
