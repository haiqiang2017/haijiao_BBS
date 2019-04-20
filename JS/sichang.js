  function GMergeCells(tableID, colList){
           var i=0,j=1;
            var ColArray = colList.split(",");//跟随合并列
           var tTable = $('#' + tableID);
           var data= tTable.datagrid("getRows");
          
           while(j<data.length){
               if (data[i]['NAME']==data[j]['NAME'])
               {
                   tTable.datagrid('mergeCells', {
                                index: i,
                                field: 'NAME',
                                rowspan: j-i+1
                            });
                    //跟随合并列
                    for(var k=0;k<ColArray.length;k++)
                    {
                       tTable.datagrid('mergeCells', {
                                index: i,
                                field: ColArray[k],
                                rowspan: j-i+1
                            });               
                    }
                    j++;
               }else{
                  i=j;
                  j++;
               }
           }
    }   
        
     function addTab(title, url) {//高俊涛修改，若标签存在，则选择该标签并刷新2014-10-30
        
            var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
            if (!$("#tab").tabs("exists", title)) {
               
                $("#tab").tabs("add", {
                    title: title,
                    closable: true,
                    content: content
                });

            } else {
                $("#tab").tabs("select", title);
                var pp=$("#tab").tabs('getSelected');
                $("#tab").tabs('update',{
                  tab:pp,
                  options:{
                     content:content
                  }
                });
                pp.panel('refresh');
            }
        }

        function addTab_tree(subtitle, url) {

            if (!$('#tab').tabs('exists', subtitle)) {
                $('#tab').tabs('add', {
                    title: subtitle,
                    content: '<iframe  scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>',
                    closable: true
                   
                });
            } else {

                $('#tab').tabs('select', subtitle);
            }
        }