using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterControl : MonoBehaviour
{
    [SerializeField]
    private CameraControl cameraControl;
    private Charactermove charactermove;

    private void Awake()
    {
        charactermove = GetComponent<Charactermove>();
    }

    private void Update()
    {
        float x = Input.GetAxisRaw("Horizontal");
        float z = Input.GetAxisRaw("Vertical");

        charactermove.MoveTo(new Vector3(x, 0, z));

        float mouseX = Input.GetAxis("Mouse X");
        float mouseY = Input.GetAxis("Mouse Y");

        cameraControl.RotateTo(mouseX, mouseY);
    }
}
