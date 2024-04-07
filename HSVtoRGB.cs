using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HSVtoRGB : MonoBehaviour
{
    public Color _Color = new Color(1,1,1,1);
    public float H = 136.0f;
    public float S = 95.0f / 100.0f;
    public float V = 80.0f / 100.0f;
    public float A = 1.0f;



    // Start is called before the first frame update
    void Start()
    {
        float C = V * S;
        float X = C * (1 - Mathf.Abs(Mathf.Repeat(H / 60.0f,  2) - 1));
        float m = V - C;
        float r = 0, g = 0, b = 0;

        if ( 0 <= H && H < 60)
        {
            r = C;
            g = X;
        }
        else if (60 <= H && H < 120)
        {
            r = X;
            g = C;
        }
        else if (120 <= H && H < 180)
        {
            g = C;
            b = X;
        }
        else if (180 <= H && H < 240)
        {
            g = X;
            b = C;
        }
        else if (240 <= H && H < 300)
        {
            r = X;
            b = C;
        }
        else if (300 <= H && H < 360)
        {
            r = X;
            g = C;
        }
        _Color = new Color((r+m), (g+m), (b+m), 1);
        Debug.Log("원하는 색상: " + _Color);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
