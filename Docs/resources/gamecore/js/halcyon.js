
$(function() {

  function showArrow(index)
  {
    return function() {
      $('#arrow-' + index).show();
    }
  }

  function clicked(myelement)
  {
    //console.log('in clicked')
    var filename = window.location.pathname.split('/').pop();
    var addXDKToURL = 0;
    if (filename.toLocaleLowerCase() == "gdk")
    {
      addXDKToURL = 1;
    }

    nextIDStr = $(myelement).parent().parent().next().attr('id');
    myIDStr = $(myelement).parent().parent().attr('id');
    myID = Number(myIDStr.replace("entry-",""));
    addChildren = 0;
    if (nextIDStr != undefined)
    {
      nextID = Number(nextIDStr.replace("entry-",""));
      if (TOCData.tocfile_titles[TOCData.tocfile_titles_lookup[nextID]].parent != myID)
      {
        addChildren = 1;
      }
    }
    else
    {
      addChildren = 1;
    }
    if (addChildren == 1)
    {
      //if the parent of the next entry isn't this element then add this element's children
        firstChild = TOCData.tocfile_hash[myID][0];
        lastChild = TOCData.tocfile_hash[myID][1];
        if (firstChild != -1)
        {
          TOCString = "";
          for (i = firstChild; i <= lastChild; i++)
          {
            TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[i]],addXDKToURL,0);
          }
          $( TOCString ).insertAfter($(myelement).parent().parent());
          
          //set click function for loaded elements
          $('.halcyon-arrow').off('click').click(function() {
            clicked($(this));
          });  

        }
    

    }


  

    var shouldOpen = true;
    
        if ($(myelement).hasClass('disclosure-open'))
        {
          $(myelement).removeClass('disclosure-open');
          $(myelement).addClass('disclosure-closed');
    
          shouldOpen = false;
        }
        else
        {
          $(myelement).removeClass('disclosure-closed');
          $(myelement).addClass('disclosure-open');
        }
    
    
        index = $(myelement).attr('index');

        // add code to add children here //
        // check if children are already there
        // if children aren't already there add them

        start_level = $('#entry-' + index).attr('level');
        start_level_int = parseInt(start_level);
    
        cur_index = parseInt(index) + 1;
        
        elem = $(myelement).parent().parent().next();

        while(true)
        {
          //elem = $('#entry-' + cur_index);
    
          //if (elem.length == 0)
          //{
          //  break;
          //}
          cur_level_str = $(elem).attr('level');
          if (typeof cur_level_str == typeof undefined || cur_level_str == false)
          {
            break;
          }
    
          cur_level = parseInt(elem.attr('level'));
    
          if (cur_level == start_level_int)
          {
            break;
          }
    
          if ((shouldOpen) && (cur_level == (start_level_int + 1)))
          {
            //elem.css("display", "block");
            //elem.show();
    
            elem.slideDown(400, showArrow(cur_index));
    
          }
          else if ((!shouldOpen) && (cur_level > start_level_int))
          {
            //elem.css("display", "none");
            //elem.hide();
            elem.slideUp();
            arrow = $(elem).children("span").children("a");
            //arrow = $('#arrow-' + cur_index);
    
            if (arrow.length != 0)
            {
              $('#arrow-' + cur_index).hide();
    
              if (arrow.hasClass('disclosure-open'))
              {
                arrow.removeClass('disclosure-open');
                arrow.addClass('disclosure-closed');
              }
            }
          }
          elem = $(elem).next();
          //cur_index++;
        }    
  }
  $('.halcyon-arrow').click(function() {

    //console.log('in click');
    clicked($(this));
    return;
  });

  $.fn.exists = function () {
    return this.length !== 0;
  }

  const headerHeight = 160;

  function computeLeftNavSize()
  {
    targetHeight = $(window).height() - headerHeight;

    if (targetHeight > $("#halcyon-doc-content-inner").height())
    {
      $("#halcyon-left-nav-fixed").css("position", "static");
    }
    else
    {
      $("#halcyon-left-nav-fixed").css("position", "fixed")
      $("#halcyon-left-nav-inner").height(targetHeight);
    }
  }

  var leftNavTop = 0;
  var rightNavStartTop = parseInt($("#halcyon-right-nav ul.nav").css("top"));

  function computeScrollOffset()
  {
    var newOffset = Math.min(maxOffset, $(window).scrollTop());

    leftNavTop = maxOffset - newOffset;
    $("#halcyon-left-nav-fixed").css("top", leftNavTop.toString() + "px");

    if ($("#headerWrapper").exists())
    {
      rightNavOffset = $("#headerWrapper").offset().top + $("#headerWrapper").height();
      var newOffset = Math.max(rightNavOffset - $(window).scrollTop(), 0);

      $("#halcyon-right-nav ul.nav").css("top", (newOffset + rightNavStartTop).toString() + "px");
    }
  }

  $(window).resize(function() {
    computeLeftNavSize();
  });

  var startPos = $("#halcyon-left-nav-fixed > h3 > a").offset().top - $(window).scrollTop();
  var navMargin = parseInt($(".side-nav h3").css("margin-top"));
  var maxOffset = startPos - navMargin;

  var leftNavMargin = parseInt($("#halcyon-left-nav-inner").css("padding-bottom"));

  function computeLeftNavOffset()
  {
      var leftNavBottom = $("#halcyon-left-nav-inner").offset().top + $("#halcyon-left-nav-inner").height() + leftNavMargin;

      var footerAbsoluteTop = 0;
      var footerRelativeTop = 0;

      if ($("#footerWrapper").exists())
      {
        footerAbsoluteTop = $("#footerWrapper").offset().top;
      }
      else
      {
        footerAbsoluteTop = $(document).height();
      }


      footerRelativeTop = footerAbsoluteTop - $(window).scrollTop();

      if (leftNavBottom > footerAbsoluteTop)
      {
        $("#halcyon-left-nav-fixed").css("top", (leftNavTop - (leftNavBottom - footerAbsoluteTop)).toString() + "px");
      }

      var rightNavBottom = $("#halcyon-right-nav ul.nav").offset().top + $("#halcyon-right-nav ul.nav").height();

      if (rightNavBottom > footerAbsoluteTop)
      {
        var curTop = parseInt($("#halcyon-right-nav ul.nav").css("top"));
        curTop -= (rightNavBottom - footerAbsoluteTop)

        $("#halcyon-right-nav ul.nav").css("top", curTop.toString() + "px");
      }
  }

  $(window).scroll(function() {
    computeScrollOffset();
    computeLeftNavOffset();
  });

  function onTOCLoaded() 
  {
    
    //find the link that matches the current page and mark it as the active document
    
    //var searchString = "a[href='"+window.location.pathname+"']";
    var popVal = window.location.pathname.split('/').pop();
    if (popVal.toLocaleLowerCase() == "" | popVal.toLocaleLowerCase() == "gdk" || popVal.toLocaleLowerCase() == "gdk/")
    {
      popVal = "index";
    }
    var searchString = "a[href='"+popVal.toLocaleLowerCase()+"']";
    
    searchString = searchString.replace(".html","");
    $('#halcyon-left-nav-inner').find(searchString).attr("style","font-weight: bold");
    $('#halcyon-left-nav-inner').find(searchString).attr("id","active-document");

    parentIDStack = [];
    parentObjectStack = [];
    var myParentID = $('#halcyon-left-nav-inner').find(searchString).parent().attr("parent");
    //console.log("creating stack of parents:")
    while (myParentID > -1) {
      //console.log("pushing : " + myParentID);
      parentIDStack.push(myParentID);
      searchString = "li[id='entry-"+myParentID +"']"
      myParentID = $('#halcyon-left-nav-inner').find(searchString).attr("parent");
      
      myParentObject = $('#halcyon-left-nav-inner').find(searchString);
      parentObjectStack.push(myParentObject);
      
    }

    //set click function for loaded elements
    $('.halcyon-arrow').click(function() {
          clicked($(this));
    });  

    //computeLeftNavSize();
    //computeLeftNavOffset();
    //computeScrollOffset();

    myParentID = parentIDStack.pop();
    //console.log("ancestory for current page:");
    while (myParentID != undefined) {
          
      //console.log("parent is " + myParentID);
      myParentID = parentIDStack.pop();
      //need to add click here
      myParentObject = parentObjectStack.pop();
      //console.log("my ID is: " + myParentObject.attr("id"));
      clicked(myParentObject.children("span").children("a[href=\"javascript:void(0)\"]"));
    }

    computeLeftNavSize();
    computeLeftNavOffset();
    computeScrollOffset();

  }

  var TOCData;

  function findTitleIndex(title)
  {
    var left = 0;
    var right = TOCData.tocfile_titles.length - 1;
    while (1)
    {
      position = Math.floor((left + right) / 2);
      //comparisonResult = title.localCompare(TOCData.tocfile_titles[position].file); 
      comparisonResult = title.toLowerCase() < TOCData.tocfile_titles[position].file.toLowerCase() ? -1 : +(title.toLowerCase() > TOCData.tocfile_titles[position].file.toLowerCase());
      if (left > right) //couldn't find the title
      {
        console.log("Couldn't find " + title + " in findTitleIndex");
        return -1;
      }
      if (comparisonResult == 0) return position;
      if (comparisonResult == 1) //title is greater than title in table so go right
      {
        left = position+1;
      }
      if (comparisonResult == -1) //title is less than title in table so go left
      {
        right = position-1;
      }
    }
  }

  function level_to_margin(level)
  {
    margin = level * 15

    if (level > 0)
    {
      margin -= 15
    }

    return margin
  }

  function level_to_padding(level)
  {
    padding = 0

    //#if (level > 0)
    padding = 15
    //#end

    return padding
  }

  function level_to_disclosure_arrow_position(level)
  {
    return (level - 1) * 15;
  }
  

  function buildTOCElement(elementIndex, addToURL, arrowDisclosure)
  {
    elementString = null;
    titleElement = TOCData.tocfile_titles[elementIndex];
    marginLeft = level_to_margin(titleElement.level+1);
    backgroundColor ="#f8f8ff;";
    paddingLeft = level_to_padding(titleElement.level);
    fontSize = 0.965;
    filename = titleElement.file;
    //if it's an absolute path don't change the URL
    if (filename.startsWith("http"))
    {
      addToURL = 0;
    }    
    title= titleElement.title;
    disclosure = "closed";
    if (arrowDisclosure == 1)
    {
      disclosure = "open";
    }
    hasChildren = TOCData.tocfile_hash[titleElement.id][0];

    elementString = "<li parent=\"" + titleElement.parent + "\" level=\"" + titleElement.level + "\" id=\"entry-" + 
      titleElement.id + "\" class=\"toc-entry\" style=\"margin-left: " + marginLeft + "px; padding-left: \"" + 
      paddingLeft + "px; font-size: " +fontSize+ "em; background-color: " + backgroundColor + ";\">\n";
      if (hasChildren != -1)
      {
        elementString+=  "<span>\n    <a href=\"javascript:void(0)\" id=\"arrow-" +
        titleElement.id + "\" index=\""+titleElement.id + "\" class=\"halcyon-arrow disclosure-" +
        disclosure+"\" style=\"float: left; position: absolute; left: -15px\">      <img class=\"halcyon-arrow-image\" src=\"" + gHalcyonArrowURL + "\" height=10/>\n    </a>\n  </span>\n"  ;
      }
      if (filename != "")
      {
        if (addToURL == 0)
        {
          elementString += "<a href=\"" + filename + "\">\n    <span>"
        }
        else
        {
          elementString += "<a href=\"" + "gdk/" +filename + "\">\n    <span>"
        }
        elementString+= title + "<br></span>\n  </a>\n</li>";
      }
      else
      {
        elementString += "\n    <span>"
        elementString+= title + "<br></span>\n  \n</li>";
      }
      
    return elementString;
  }





  
  function buildTOCFromJson()
  {

    var currentLevel;
    var filename = window.location.pathname.split('/').pop();
    var addXDKToURL = 0;
    if (filename.toLocaleLowerCase() == "gdk" || filename.toLocaleLowerCase() == "gdk/" || filename == "")
    {
      if (filename.toLocaleLowerCase() == "gdk")
      {
        addXDKToURL = 1;
      }
      filename = "index";
      
    }
    filename = filename.replace(".html","");
    var titleIndex = findTitleIndex(filename);
    if (titleIndex == -1)
    {
      filename = "index";
      titleIndex = findTitleIndex(filename);
    }

    titleElement = TOCData.tocfile_titles[titleIndex];

    TOCString = "<ul>";
    var iTopLevelNodeIndex = 0;
    if (titleElement.parent == -1)
    {
      var currentTopLevelElementID = titleElement.id;
      while (TOCData.tocfile_tree[iTopLevelNodeIndex] != currentTopLevelElementID)
      {
        TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[iTopLevelNodeIndex]],addXDKToURL, 0);  
        iTopLevelNodeIndex++;
      }

      TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[iTopLevelNodeIndex]],addXDKToURL, 1);
      //if top level element, show its children
      startChildren = TOCData.tocfile_hash[titleElement.id][0];
      endChildren = TOCData.tocfile_hash[titleElement.id][1];
      if (startChildren != -1)
      {
        for ( i = startChildren; i < endChildren+1; i++)
        {
          TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[i]],addXDKToURL,0);
        }
      }

    }
    else //add parents all the way back to the root element
    {
      currentElementID = titleElement.id;
      currentElement = TOCData.tocfile_titles[TOCData.tocfile_titles_lookup[currentElementID]];
      deepestLevel = currentElement.level;
      var parentStack = [];
      var returnIDStack = [];
      var returnTreeIndexStack = [];
      //add parents to stack
      while (currentElement.parent != -1)
      {
        parentStack.push(currentElement.parent);
        currentElement = TOCData.tocfile_titles[TOCData.tocfile_titles_lookup[currentElement.parent]];
      }

      //console.log("")
      currentLevel = 1;
      TOCString = "<ul>\n";
      

      //Get level 1 nodes before the level one node that is a parent of the current topic
      while (TOCData.tocfile_tree[iTopLevelNodeIndex] != currentElement.id)
      {
        TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[iTopLevelNodeIndex]],addXDKToURL,0);  
        iTopLevelNodeIndex++;
      }
      
      TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[currentElement.id],addXDKToURL,0); 

      var remainingChildrenStack = [];

      //add parents
      while (currentLevel < deepestLevel)
      {
        popedParent = parentStack.pop();
  
        currentElement = TOCData.tocfile_titles[TOCData.tocfile_titles_lookup[popedParent]];

        startChildren = TOCData.tocfile_hash[currentElement.id][0];
        endChildren = TOCData.tocfile_hash[currentElement.id][1];
        currentReturnIndex = startChildren;
        //console.log("**writing from StartChildren")
        //add children of the current parent until we hit the next parent in the stack
        for (i = startChildren; i <= endChildren; i++)
        {
          TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[i]],addXDKToURL,0);
          //console.log(TOCData.tocfile_tree[i]);
          currentReturnIndex = i;
          if (TOCData.tocfile_tree[i] == parentStack[parentStack.length-1])
          {
            break;
          }
        }


        currentLevel +=1;

        currentReturnIndex++;

        remainingChildren = [currentReturnIndex,endChildren];
        remainingChildrenStack.push(remainingChildren);

        //cache the ID we left off on 
        returnIDStack.push(currentElement.id);

        //cache the index we left off on 
        returnTreeIndexStack.push(currentReturnIndex);
      }
      //console.log("*** returnIDStack = " + returnIDStack);
      //console.log("*** returnTreeIndexStack = " + returnTreeIndexStack);

    }

    //console.log("writing from left off positions")
    ///left off here///
    currentLevel -= 1;
    while (currentLevel > 1)
    {
      childToContinueFrom = returnTreeIndexStack[returnTreeIndexStack.length - 2];
      //get startChildren and endChildren from returnIDStack[returnIDStack.length - 2]
      endChildren = TOCData.tocfile_hash[returnIDStack[returnIDStack.length - 2]][1];

      if (childToContinueFrom <= endChildren)
      {
        for (i = childToContinueFrom; i <= endChildren; i++)
        {
          TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[i]],addXDKToURL,0);
          //console.log(TOCData.tocfile_tree[i]);
        }
      }
      returnTreeIndexStack.pop();
      returnIDStack.pop();
      currentLevel -= 1;

    }

          
          iTopLevelNodeIndex++;
          while (TOCData.tocfile_titles[TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[iTopLevelNodeIndex]]].level == 1)
          {
            TOCString += buildTOCElement(TOCData.tocfile_titles_lookup[TOCData.tocfile_tree[iTopLevelNodeIndex]],addXDKToURL);  
            iTopLevelNodeIndex++;
          }
    
    

    TOCString += "</ul>";
    return TOCString;

  }

  function loadJson(url)
  {
    if (document.addEventListener) 
    {
      document.addEventListener('click', interceptDocClickEvent);
    } 
    else if (document.attachEvent) 
    {
      document.attachEvent('onclick', interceptDocClickEvent);
    }
    //$(document).click(myclicked);
    var TOCString = null;
    if (sessionStorage.getItem(gSessionKey)) {
      JSONString = sessionStorage.getItem(gSessionKey);
      TOCData = JSON.parse(JSONString)
      document.getElementById('halcyon-left-nav-inner').innerHTML = buildTOCFromJson();
      onTOCLoaded();
    }
    else
    {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          // Action to be performed when the document is read;

          JSONString = xmlhttp.responseText;
          TOCData = JSON.parse(JSONString);
          sessionStorage.setItem(gSessionKey,JSONString);
          document.getElementById('halcyon-left-nav-inner').innerHTML = buildTOCFromJson();
          onTOCLoaded();
    
        }
        else if (this.status == 400){
          console.log('could not load document!!!!')
        }
      }; 
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
  }
    //console.log('path is ');
    //console.log(window.location.pathname);
    return;// xmlhttp.responseText;
    
  }

  
  function interceptDocClickEvent(e) {

    if (window.location.hostname == "developer.microsoft-int.com" || window.location.hostname == "localhost")
    {
      var href;
      var target = e.target || e.srcElement;
      console.log("Intercepted click");
      var parentNode = target.parentNode;
      if (target.tagName !== 'A')  
      {
        if (parentNode.tagName === 'A') 
        {
          target = parentNode;
        }
        else
        {
          return;
        }
      }
      if (target.tagName === 'A') {

          href = target.getAttribute('href');
          console.log("Intercepted link click: " + href);
          
          filename = href.replace(".html","");
          //see if it's a relative link
          var titleIndex = findTitleIndex(filename);
          if (titleIndex != -1) 
          {
            console.log("found relative link: " + href);
            window.location.assign(href+window.location.search);
            window.location.href = href+window.location.search;
          }
          else //check to see if it's a cross link between partner and the XDK docs
          {
            //en-us/games/xbox/partner
            //en-us/games/xbox/partner/xbox360
            //en-us/games/xbox/docs/xdk
            var hrefMatches = href.match(/https:\/\/developer.microsoft.com\/en-us\/games\/xbox\/docs\/xdk\/([A-Za-z-_0-9]*)/);
            if (hrefMatches != null)
            {
              console.log("found link into XDK (PROD) docs fom INT")
              window.location.assign("https://developer.microsoft-int.com/en-us/games/xbox/docs/xdk/" + hrefMatches[1] + "?setvar=fltpreview:1");
            }
            else
            {
              window.location.assign(href);
            }
          }
          //put your logic here...
          if (true) {

            //tell the browser not to respond to the link click
            e.preventDefault();
            
          }
      }
    }
  }

  ///////////////////////////////
  var gHalcyonArrowURL;
  function reloadPage()
  {
    var fltpreview = getFltpreview(urlParams);//urlParams.get('setvar');
    if (fltpreview == "fltpreview:1")
    {
      window.location.assign(window.location.href + "?setvar=fltpreview:1");
    }
    else
    {
        window.location.assign(window.location.href);
    }
    //location.reload(true);
  }
  function printFriendlyWindow()
  {
    var fltpreview = getFltpreview(urlParams);//urlParams.get('setvar');
    var newwindow = null;
    if (fltpreview == "fltpreview:1")
    {
      newwindow = window.open(window.location.href + "&printview=1");
    }
    else
    {
      newwindow =  window.open(window.location.href + "?printview=1");
    }
    newwindow.print();
  }
  function printInnerText()
  {
    document.getElementById("halcyon-doc-content").setAttribute("class","");
    document.getElementById("halcyon-doc-content-inner").setAttribute("class","");
    var leftnav = document.getElementById("halcyon-left-nav");
    leftnav.style.display = 'none';
    leftnav.parentElement.removeChild(leftnav);
    var rightnav = document.getElementById("halcyon-right-nav");
    rightnav.parentElement.removeChild(rightnav);
    console.log("trying to find clearBoth");
    var footer = document.getElementsByClassName("clearBoth");
    if (footer[0])
    {
        console.log("trying to remove clearBoth");
        footer[0].parentElement.removeChild(footer[0]);
    }
    console.log("trying to find site-inspector");
    var siteinspector = document.getElementById("site-inspector");
    if (siteinspector)
    {
      console.log("trying to find remove");
        siteinspector.parentElement.removeChild(siteinspector);
    }
    console.log("trying to find flightPicker");
    var flightpicker = document.getElementById("flightPicker");
    if (flightpicker)
    {
      console.log("trying to remove flightPicker");
        flightpicker.parentElement.removeChild(flightpicker);
    }
    console.log("trying to find headerWrapper");
    var headwrapper = document.getElementById("headerWrapper");
    if (headwrapper)
    {
      console.log("trying to remove headerWrapper");
        //headwrapper.style.display = 'none';
        headwrapper.parentElement.removeChild(headwrapper);
    }
    console.log("trying to update margins and width");
    document.getElementById("halcyon-doc-content").style.marginLeft = "0px";
    document.getElementById("halcyon-doc-content").style.width = "800px";
    document.getElementById("halcyon-doc-content-inner").style.marginLeft = "0px";
    document.getElementById("halcyon-doc-content-inner").style.width = "800px";
  }
  function addVariableToURL(variable)
  {
    var symbol = "&";
    if (window.location.href.indexOf("?") === -1)
    {
      symbol = "?"
    }
    return window.location.href + symbol + variable;
  }
  function getFltpreview(urlsearchparams)
  {
    var returnvalue = "";
    for (var pair of urlsearchparams.entries())
    {
      if (pair[0] == "setvar")
      {
        if (pair[1] == "fltpreview:1")
        {
          return "fltpreview:1";
        }
      }
    }
    return returnvalue;
  }

  function loadPage(href)
  {
    //listen for link click events at the document level
    if (document.addEventListener) 
    {
      document.addEventListener('click', interceptDocClickEvent);
    } 
    else if (document.attachEvent) 
    {
      document.attachEvent('onclick', interceptDocClickEvent);
    }


    var TOCString = null;

    if (sessionStorage.getItem("TOC")) {
      //console.log("Found TOC in sessionStorage");
      TOCString = sessionStorage.getItem("TOC");

      //replace references to /resources/xdk/images/arrow.png with halcyon path and token
      //TOCString = TOCString.split("/resources/xdk/images/arrow.png").join(HalcyonArrowURL);
                
      document.getElementById('halcyon-left-nav-inner').innerHTML = TOCString;
      onTOCLoaded();
    
    }
    else
    {
      //console.log("TOC isn't in sessionStorage yet, making web request");
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          // Action to be performed when the document is read;
          //console.log('loaded' + href);

          //set the TOC to the contents of the loaded html file
          TOCString = xmlhttp.responseText;
          //var tocStart = TOCString.indexOf("<span class=\"_tocstart_\"/>") + 26;
          //var tocEnd = TOCString.indexOf("<span class=\"_tocend_\"/>");
          //TOCString = TOCString.slice(tocStart,tocEnd);

          //replace references to /resources/xdk/images/arrow.png with halcyon path and token
          TOCString = TOCString.split("/resources/gdk/images/arrow.png").join(HalcyonArrowURL);
          document.getElementById('halcyon-left-nav-inner').innerHTML = TOCString;
          
          sessionStorage.setItem("TOC",TOCString);
          onTOCLoaded();
        }
        else if (this.status == 400){
          //console.log('could not load document!!!!')
        }
      }; 
    xmlhttp.open("GET", href, true);
    xmlhttp.send();
  }
    //console.log('path is ');
    //console.log(window.location.pathname);
    return;// xmlhttp.responseText;
  }
  
  // Initialization
  //computeLeftNavSize();
  //computeLeftNavOffset();
  //computeScrollOffset();
  //loadPage('tocfile.txt');
  //TOCUrl = $('#xdk_toc').attr('href');
  HalcyonArrowURL = $('#halcyon_arrow_image').attr('href');
  HalcyonArrowURL = HalcyonArrowURL.split("?token=")[0];
  gHalcyonArrowURL = HalcyonArrowURL;
  tocfile_json_url = $('#tocfile_json').attr('href');
  gSessionKey = $('#session_key').attr('href');
  //if this is a live page or a -int page with setvar go ahead and load the TOC
  var urlParams = new URLSearchParams(window.location.search);
  var printview = urlParams.get('printview');
  var fltpreview = getFltpreview(urlParams);//= urlParams.get('setvar');
  //if ((window.location.hostname != "developer.microsoft-int.com" && window.location.hostname != "localhost") || window.location.search == "?setvar=fltpreview:1")
  if ((window.location.hostname != "developer.microsoft-int.com" && window.location.hostname != "localhost") || fltpreview == "fltpreview:1")
  {
     if (printview == "1")
     {
        //document.write(document.getElementById("halcyon-doc-content-inner").innerHTML);
        printInnerText();
     }
     else
     {
    loadJson(tocfile_json_url);
     }
  }
  else //if this is a -int page without setvar, reload it with the setvar
  {
    window.location.assign(addVariableToURL("setvar=fltpreview:1"));
  }

  document.getElementById("printbutton").onclick = printFriendlyWindow;
  var printlinks = document.getElementsByClassName("printlink");
  for (i = 0; i< printlinks.length; i++)
  {
    printlinks[i].onclick = printFriendlyWindow;
  }
  document.getElementById("reloadpage").onclick = reloadPage;

  $('body').scrollspy({ target: '#halcyon-right-nav' });
});
