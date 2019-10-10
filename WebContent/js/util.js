dojo.addOnLoad(function() {
	dojo.addClass(dojo.body(), "claro");
	dojo.require("dijit.form.Form");
	dojo.require("dijit.Dialog");
	dojo.require("dijit.form.FilteringSelect");
	dojo.require("dijit.form.TextBox");
	dojo.require("dijit.form.Button");
	dojo.require("dojo.data.ItemFileWriteStore");
	dojo.require("dijit.form.ValidationTextBox");
    dojo.require("dijit.form.DateTextBox");
    dojo.require("dijit.form.TimeTextBox");
    dojo.require("dijit.TitlePane");
    dojo.require("dijit.form.NumberSpinner");
    dojo.require("dijit.form.SimpleTextarea");
    dojo.require("dijit.form.RadioButton");
    dojo.require("dijit.form.CheckBox");
    dojo.require("dijit.form.DropDownButton");
   	dojo.require("dijit.TooltipDialog");
	dojo.require("dojox.layout.ExpandoPane");
	dojo.require("dijit.layout.TabContainer");
	dojo.require("dijit.layout.BorderContainer");
	dojo.require("dijit.layout.AccordionContainer");
	dojo.require("dijit.layout.SplitContainer");
  	dojo.require("dijit.layout.ContentPane");
	dojo.require("dojo.data.ItemFileReadStore");
	dojo.require("dojox.image.Lightbox");
	dojo.require("dojox.grid.TreeGrid");
	dojo.require("dijit.tree.ForestStoreModel");
	dojo.require("dojox.widget.Dialog");
	dojo.require("dojox.grid.DataGrid");
	dojo.require("dojo.parser");
	dojo.require("dijit.form.ValidationTextBox");
	dojo.require("dijit.form.FilteringSelect");
	dojo.require("dijit.form.SimpleTextarea");
	hideLoader();
});

var hideLoader = function(){
	dojo.fadeOut({
		node: "preloader",
		duration: 700,
		onEnd: function(){
			dojo.style("preloader", "display", "none");
		}
	}).play();
};