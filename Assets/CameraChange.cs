using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraChange : MonoBehaviour
{
    public Camera camera1;
    public Camera camera2;
    public Camera camera3;

    void Start()
    {
        Showcamera1View();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            Showcamera1View();
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            Showcamera2View();
        }
        else if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            Showcamera3View();
        }

    }

    public void Showcamera1View()
    {
        camera1.enabled = true;
        camera2.enabled = false;
        camera3.enabled = false;
    }
    
    public void Showcamera2View()
    {
        camera1.enabled = false;
        camera2.enabled = true;
        camera3.enabled = false;
    }

    public void Showcamera3View()
    {
        camera1.enabled = false;
        camera2.enabled = false;
        camera3.enabled = true;
    }
}
