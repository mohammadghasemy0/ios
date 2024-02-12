import 'package:flutter/material.dart';
import 'package:kiano/presentation/resources/assets_manager.dart';
import '../../common/state_renderer/state_renderer_test.dart';
import '/app/di.dart';
import '/presentation/screens/items_selector/item_selector_view_model.dart';

class ItemsSelector extends StatefulWidget {
  const ItemsSelector({
    Key? key,
    this.title = 'عنوان',
    required this.items,
    required this.selectedItems,
    this.multiSelect = false,
  }) : super(key: key);
  final String title;
  final Map<String, dynamic> items;
  final Map<String, dynamic> selectedItems;
  final bool multiSelect;

  @override
  State<ItemsSelector> createState() => _ItemsSelectorState();
}

class _ItemsSelectorState extends State<ItemsSelector> {
  final _viewModel = instance<ItemsSelectorViewModel>();

  @override
  void initState() {
    _viewModel.items = widget.items;
    _viewModel.selectedItems = widget.selectedItems;
    _viewModel.multiSelect = widget.multiSelect;
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState?>(
          stream: _viewModel.outputState,
          builder: (_, snapshot) {
            if (_viewModel.flowState != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _viewModel.dismissDialog(context);
                Future.delayed(const Duration(milliseconds: 2), () {
                  _viewModel.showDialogScreen(context, _viewModel.flowState!);
                  _viewModel.currentFlowState = _viewModel.flowState;
                  _viewModel.flowState = null;
                },);
              });
            }
            return _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageAssets.repeat1), repeat: ImageRepeat.repeat,opacity: .1)
      ),
      padding: const EdgeInsets.only(left: 16, top: 48, bottom: 8, right: 16),
      child: Column(
        children: [
          SearchHeaderMenu(
            hint: ' جستجو در ${widget.title}',
            onChange: (value) => _viewModel.onChangeSearchString(value),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _viewModel.changeStreamOutput,
              builder: (context, snapshot) {
                final List<String> keys = _viewModel.validItems.keys.toList();
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: keys.length,
                  itemBuilder: (context, index) => CheckboxListTile(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: _viewModel.isChecked(keys[index]),
                    title: Text(keys[index]),
                    onChanged: (value) =>
                        _viewModel.onSelectItem(keys[index], value ?? false),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                );
              },
            ),
          ),
          SizedBox(
              width: double.maxFinite,
              height: 60,
              child:
                  ElevatedButton(onPressed: ()=> Navigator.of(context).pop(_viewModel.selectedItems), child: const Text("تائید")))
        ],
      ),
    );
  }
}

class SearchHeaderMenu extends StatelessWidget {
  const SearchHeaderMenu(
      {Key? key, this.leading, this.title, this.hint, this.onChange})
      : super(key: key);
  final Widget? leading;
  final String? title;
  final String? hint;
  final Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ??
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded)),
            Expanded(
              child: TextField(
                onChanged: onChange,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
