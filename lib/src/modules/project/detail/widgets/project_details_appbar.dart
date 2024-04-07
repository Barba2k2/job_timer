import 'package:flutter/material.dart';

class ProjectDetailsAppbar extends SliverAppBar {
  ProjectDetailsAppbar({super.key}) : super(
    expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: const Text(
            'Projeto X',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1.6),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('10 Tasks'),
                          _NewTasks(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
  );
}

class _NewTasks extends StatelessWidget {
  const _NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
            ),
          ),
        ),
        const Text('Adicionar Task')
      ],
    );
  }
}
