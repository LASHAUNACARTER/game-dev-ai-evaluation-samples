# panda3d_asset_pipeline.py
# Purpose: Automates the loading of 3D assets, applies PBR materials, 
# and optimizes collision solids for performance.
# AI Evaluation Context: Tests AI understanding of Panda3D's NodePath hierarchy,
# GeomVertexFormat, and proper memory management via removeNode().

from direct.showbase.ShowBase import ShowBase
from panda3d.core import loadPrcFileData, GeomVertexFormat, Geom, GeomNode
from panda3d.bullet import BulletRigidBodyNode, BulletBoxShape

class AssetPipeline:
    def __init__(self):
        # Configure window properties if running standalone
        loadPrcFileData("", "window-type none") 

    def load_and_optimize_model(self, model_path, collision_type="box"):
        """
        Loads a model, applies a default PBR material, and generates 
        optimized collision solids.
        """
        try:
            # Load the model
            model = loader.loadModel(model_path)
            
            # Apply PBR Material (Simulated)
            # In a real pipeline, this would read from a JSON sidecar file
            material = Material()
            material.setBaseColor((0.8, 0.8, 0.8, 1))
            material.setMetallic(0.5)
            material.setRoughness(0.2)
            model.setTextureOff(1) # Ensure we use vertex colors/materials if needed
            model.setMaterial(material)

            # Optimize Geometry: Flatten static geometry for draw calls
            model.flattenStrong()

            # Generate Collision Solid
            if collision_type == "box":
                bounds = model.getTightBounds()
                center = (bounds[0] + bounds[1]) / 2
                size = bounds[1] - bounds[0]
                
                bullet_node = BulletRigidBodyNode('Collision')
                shape = BulletBoxShape(size / 2)
                bullet_node.addShape(shape)
                bullet_np = render.attachNewNode(bullet_node)
                bullet_np.setPos(center)
                
                # Parent the visual model to the collision node
                model.reparentTo(bullet_np)
                
                return bullet_np

        except Exception as e:
            print(f"Error processing asset {model_path}: {e}")
            return None

# Example Usage for AI Testing:
# pipeline = AssetPipeline()
# enemy_np = pipeline.load_and_optimize_model("models/enemy_robot.egg", "box")
