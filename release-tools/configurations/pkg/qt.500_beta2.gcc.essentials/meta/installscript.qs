/* This file is part of the Qt SDK

*/

// constructor
function Component()
{
    if (component.fromOnlineRepository)
    {
        // Commented line below used by the packaging scripts
        //%IFW_DOWNLOADABLE_ARCHIVE_NAMES%
    }
}


checkWhetherStopProcessIsNeeded = function()
{
}


Component.prototype.createOperations = function()
{
    component.createOperations();

    if (installer.value("os") == "x11") {
        try {
            // patch Qt binaries
            component.addOperation( "QtPatch", "linux", installer.value("TargetDir") + "%TARGET_INSTALL_DIR%" );
        } catch( e ) {
            print( e );
        }

        try {
            // set assistant binary path
            var assistantBinary = installer.value("TargetDir") + "%TARGET_INSTALL_DIR%" + "/bin/assistant";
            installer.setValue("AssistantBinary", assistantBinary);
        } catch( e ) {
            print( e );
        }

        try {
            // patch Qt binaries
            var path = installer.value("TargetDir") + "%TARGET_INSTALL_DIR%";
            var script = path + "/patcher.sh";
            component.addOperation("Execute", "{0}", "/bin/bash", script, path);
            component.addOperation("Execute", "{0}", "/bin/rm", script);
        } catch( e ) {
            print( e );
        }
    }
}


Component.prototype.installationFinished = function()
{
}

