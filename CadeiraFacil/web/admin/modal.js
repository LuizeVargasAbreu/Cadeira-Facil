(function ()
{
    const modal = document.getElementById("myModal");
        modal.style.display = "block";
})();

function fecharModal()
{
    modal = document.getElementById("myModal");
    if (modal.style.display === "block")
    {
        modal.style.display = "none";
        
    }
}