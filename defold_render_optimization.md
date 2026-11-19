# Defold Render Optimization Guide

## Overview
Defold uses a custom renderer defined in `render.script`. Optimizing this script is critical for mobile deployment to reduce draw calls and manage texture atlases effectively.

## Key Optimization Strategies

### 1. Texture Atlasing
Defold automatically packs textures into atlases. To maximize efficiency:
- Group UI elements, tilemaps, and character sprites into separate collection proxies.
- Ensure all materials used in a single render pass share the same atlas to avoid texture swaps.

### 2. Batch Rendering in `render.script`
In the `update()` function of your render script, minimize state changes:
```lua
function update(self)
    -- Clear buffers
    render.clear({depth=1, color={0,0,0,0}})
    
    -- Set viewport
    render.set_viewport(0, 0, render.get_width(), render.get_height())
    
    -- Draw all opaque objects first (batched)
    render.draw("@opaque")
    
    -- Draw transparent objects last (sorted)
    render.draw("@translucent")
end
