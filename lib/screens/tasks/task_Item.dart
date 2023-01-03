import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_1/styles/my_theme.dart';

class TaskItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.4,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed:(buildContext){},
              backgroundColor: MyTheme.allRed,
              icon: Icons.delete,
              label: "Delete",
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
              foregroundColor: MyTheme.allWhite,),
            SlidableAction(
              onPressed:(buildContext){},
              backgroundColor: MyTheme.allBlue,
              icon: Icons.edit,
              label: "Edit",
              // borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
              foregroundColor: MyTheme.allWhite,),
          ],

        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          // margin: EdgeInsets.all(10),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
            color:MyTheme.allWhite,

          ),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: MyTheme.allBlue,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Task Title',style: Theme.of(context).textTheme.headline2,),
                        Text('10 / 12 /2022',style: Theme.of(context).textTheme.headline4,)
                      ],),
                    SizedBox(width: 10,),
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(
                    //       Icons.check_box_rounded,
                    //       color: MyTheme.allBlue,
                    //       size: 50,
                    //     ))
                    InkWell(child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: MyTheme.allBlue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.check,color: MyTheme.allWhite,size: 40,)))
                  ],),
              )

            ],
          ),
        ),
      ),
    );
  }
}
