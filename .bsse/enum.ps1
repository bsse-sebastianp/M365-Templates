enum Group_type {
    Dynamic_device = "DynamicMembership"
    Dynamic_user = "Dynamic user"
}


Add-Type -TypeDefinition @"
   public enum Group_type
   {
    Dynamic_device,
    Dynamic_user,
    DynamicMembership
   }
"@