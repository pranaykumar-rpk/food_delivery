import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/home_screen/controllers/home_Page_cubit.dart';
import 'package:food_delivery/home_screen/models/home_page_state.dart';

class AddressAndSearchBarSection extends StatefulWidget {
  const AddressAndSearchBarSection({super.key});

  @override
  State<AddressAndSearchBarSection> createState() =>
      _AddressAndSearchBarSectionState();
}

class _AddressAndSearchBarSectionState
    extends State<AddressAndSearchBarSection> {
  final TextEditingController _searchController = TextEditingController();
  final HomePageControllerCubit _controller = HomePageControllerCubit();

  void _search(String value) {
    _controller.search(value);
  }

  void _handleOnLocationTap() {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: const Center(
            child: Text('Handle Location here...'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageControllerCubit, HomePageState>(
    bloc: _controller,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Delivery to',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/location.png',
                    height: 20,
                    width: 20,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: _handleOnLocationTap,
                      icon: Row(
                        children: const [
                          Text(
                            'Sukabumi, Indonesia',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _searchController,
                  onFieldSubmitted: _search,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none),
                    hintText: 'What did you eat today?',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
