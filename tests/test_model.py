import unittest
from stablepy.diffusers_vanilla.model import Model_Diffusers

class TestModel(unittest.TestCase):
    def test_vae_loading_fallback(self):
        try:
            model = Model_Diffusers(
                base_model_id="runwayml/stable-diffusion-v1-5",
                vae_model="non_existent_vae"
            )
            # The model should initialize without errors by falling back to a default VAE
            self.assertIsNotNone(model.pipe)
        except Exception as e:
            self.fail(f"Model initialization failed with an unexpected exception: {e}")

if __name__ == '__main__':
    unittest.main()
