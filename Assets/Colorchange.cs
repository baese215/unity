using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Colorchange : MonoBehaviour
{
    private Renderer rend;
    // Start is called before the first frame update
    void Start()
    {
         rend = GetComponent<Renderer>();
         ChangeObjectColor();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void ChangeObjectColor()
    {
        // create RGB randomly
        Color newColor = new Color(Random.value, Random.value, Random.value);

        // change coloer of renderer component of object
        rend.material.color = newColor;
    }
}
