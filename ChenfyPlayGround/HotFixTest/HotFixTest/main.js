//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// main.js
require('UIView, UIColor, UILabel,UIButton,UITapGestureRecognizer')

defineClass('ViewController', {
            // 替换这个 -genView 方法
            genView: function() {
            var view = self.ORIGgenView();
            view.setBackgroundColor(UIColor.greenColor())
            var label = UILabel.alloc().initWithFrame(view.frame());
            label.setText("JSPatch");
            label.setBackgroundColor(UIColor.cyanColor())
            label.setTextAlignment(1);
            view.addSubview(label);
            //修改ViewController的view的背景色
            self.view().setBackgroundColor(UIColor.grayColor())

            return view;
            } ,
            viewTapped:function(){
                self.view().setBackgroundColor(UIColor.yellowColor())
            
            var vc = JSViewController.new();
            self.presentViewController_animated_completion(vc, YES, block(function() {
                                                                          
                                                                          }));
            }
            
            });

//新定义一个VC
defineClass('JSViewController:UIViewController',{
            viewDidLoad:function(){
            self.view().setBackgroundColor(UIColor.orangeColor())
            
            var width_nav = self.view().frame().width;
            var viewNav = UIView.alloc().initWithFrame({x:0,y:0,width:width_nav,height:64});
            viewNav.setBackgroundColor(UIColor.redColor());
            
            var btnBack = UIButton.buttonWithType(0);
            btnBack.setFrame({x:0,y:20,width:60,height:44});
            btnBack.setTitle_forState("<  ", 0);
            btnBack.addTarget_action_forControlEvents(self, "backForward", 1 <<  6);
            viewNav.addSubview(btnBack);
            self.view().addSubview(viewNav);
            
            },
            backForward: function() {
            self.dismissViewControllerAnimated_completion(YES, block(function() {
                                                                     
                                                                     }));
            }
            
            
            })





