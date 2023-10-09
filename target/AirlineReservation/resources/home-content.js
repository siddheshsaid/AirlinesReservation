document.addEventListener('DOMContentLoaded',function(){









                    // Get references to the button and the sidebar
                    const openSidebarButton = document.getElementById('openSidebarButton');
                    const mySidebar = document.getElementById('mySidebar');
                    const closeSidebarButton=document.getElementById("closeSidebarButton")

                    //created event for button and also make display block for closesidebar and hiding opensidebar
                    openSidebarButton.addEventListener('click', () => {

                        mySidebar.style.width = '250px';
                        openSidebarButton.style.display='none'
                        closeSidebarButton.style.display='block';

                    });

                    closeSidebarButton.addEventListener('click',()=>{
                    mySidebar.style.width='0px';
                    closeSidebarButton.style.display = 'none';
                    openSidebarButton.style.display='inline'
                   });





                                        // Initial content (home page)



});


