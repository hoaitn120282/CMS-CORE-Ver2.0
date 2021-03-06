<?php

namespace App\Traits;

trait UserACL {

    /**
     * Make string to array if already not
     *
     * @param  Mixed $perm String/Array
     * @return Array
     */
    protected function getArray($perm)
    {
        return is_array($perm) ? $perm : explode('|', $perm);
    }

    /**
     * Check if the permission matches with any permission user has
     *
     * @param  Array $perm Name of a permission (one or more separated with |)
     * @return Boolean true if permission exists, otherwise false
     */
    protected function checkPermission(Array $permArray = [])
    {
        $perms = [];
        if (!empty($this->roles)) {
            $permGroups = \GuzzleHttp\json_decode($this->roles->permission, true);
            if (!empty($permGroups)) {
                foreach ($permGroups as $key => $item) {
                    $perms = array_merge($perms, array_reduce($item, function($carry, $action) use ($key) {
                        $carry[] = "{$key}@{$action}";

                        return $carry;
                    }, []));
                }
            }
        }

        return count(array_intersect($perms, $permArray));
    }

    /**
     * Checks if has a Permission
     *
     * @param  String $perm [Name of a permission]
     * @return Boolean true if has permission, otherwise false
     */
    public function hasPermission($perm = null)
    {
        if($perm) {
            return $this->checkPermission($this->getArray($perm));
        }

        return false;
    }

    /**
     * Checks if has a role
     *
     * @param  String $role [Name of a Role: Slug field in DB]
     * @return Boolean true if has permission, otherwise false
     */
    public function hasRole($role = null)
    {
        if(is_null($role)) return false;

        return strtolower($this->role->role_slug) == strtolower($role);
    }

    /**
     * Check if user has given role
     *
     * @param  String $role role_slug
     * @return Boolean TRUE or FALSE
     */
    public function is($role)
    {
        return $this->role->role_slug == $role;
    }

    /**
     * Check if user has permission to a route
     *
     * @param  String $routeName
     * @return Boolean true/false
     */
    public function hasRoute($routeName)
    {
        $route = app('router')->getRoutes()->getByName($routeName);

        if($route) {
            $action = $route->getAction();

            if (isset($action['controller'])) {
                $controller = isset($action['namespace']) ? explode("{$action['namespace']}\\", $action['controller']) : [];

                $required = !empty($controller) ? (array)$controller[1] : (array)$action['controller'];

                return $this->checkPermission($required);
            }
        }

        return false;
    }

    /**
     * Check if a top level menu is visible to user
     *
     * @param  String $perm
     * @return Boolean true/false
     */
    public function canSeeMenuItem($perm)
    {
        return $this->hasPermission($perm) || $this->hasAnylike($perm);
    }

    /**
     * Checks if user has any permission in this group
     *
     * @param  String $perm Required Permission
     * @param  Array $perms User's Permissions
     * @return Boolean true/false
     */
    protected function hasAnylike($perm)
    {
        $parts = explode('_', $perm);

        $requiredPerm = array_pop($parts);

        $perms = $this->role->permissions->fetch('permission_slug');

        foreach ($perms as $perm)
        {
            if(ends_with($perm, $requiredPerm)) return true;
        }

        return false;
    }
}
