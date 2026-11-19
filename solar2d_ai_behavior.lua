-- solar2d_ai_behavior.lua
-- Purpose: Demonstrates a robust State Machine for an NPC Enemy in Solar2D.
-- AI Evaluation Context: Tests if AI models correctly handle transition logic 
-- and avoid memory leaks by properly removing event listeners during state changes.

local M = {}

-- Define States
local STATE_IDLE = "idle"
local STATE_CHASE = "chase"
local STATE_ATTACK = "attack"

function M.newEnemy(x, y, playerRef)
    local enemy = display.newCircle(x, y, 20)
    enemy:setFillColor(1, 0, 0)
    
    -- Physics body setup
    physics.addBody(enemy, { density=1.0, friction=0.3, bounce=0.2 })
    enemy.bodyType = "dynamic"

    local currentState = STATE_IDLE
    local chaseSpeed = 150
    local attackRange = 50

    -- Internal helper to switch states safely
    local function changeState(newState)
        if currentState == newState then return end
        
        -- Cleanup previous state listeners if necessary
        if currentState == STATE_CHASE then
            Runtime:removeEventListener("enterFrame", enemy.onChaseUpdate)
        end

        currentState = newState
        print("Enemy state changed to: " .. currentState)

        if newState == STATE_IDLE then
            enemy:setLinearVelocity(0, 0)
        elseif newState == STATE_CHASE then
            Runtime:addEventListener("enterFrame", enemy.onChaseUpdate)
        end
    end

    -- Chase Logic
    function enemy:onChaseUpdate(event)
        if not playerRef then return end
        
        local dx = playerRef.x - self.x
        local dy = playerRef.y - self.y
        local distance = math.sqrt(dx*dx + dy*dy)

        if distance < attackRange then
            changeState(STATE_ATTACK)
            -- Trigger attack animation/logic here
        else
            -- Normalize vector and apply velocity
            local vx = (dx / distance) * chaseSpeed
            local vy = (dy / distance) * chaseSpeed
            self:setLinearVelocity(vx, vy)
        end
    end

    -- Simple sensor to detect player proximity for initial aggro
    local function onCollision(event)
        if event.phase == "began" then
            changeState(STATE_CHASE)
        end
    end
    
    enemy.collision = onCollision
    enemy:addEventListener("collision", enemy)

    return enemy
end

return M
