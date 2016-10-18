require('UIColor');
defineClass('ViewController', {
            viewWillAppear: function(animated) {
            self.view().setBackgroundColor(UIColor.blueColor());
            console.log("jspatch test");
            },
            });
