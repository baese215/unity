using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Charactermove : MonoBehaviour
{
    [SerializeField]
    private float moveSpeed = 5.0f;
    [SerializeField]
    private Vector3 moveDirection;

    [SerializeField]
    private Transform cameraTransform;
    private CharacterController characterController;

    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
    }

    private void Update()
    {
        characterController.Move(moveDirection * moveSpeed * Time.deltaTime);
    }

    public void MoveTo(Vector3 direction)
    {
        Vector3 movedis = cameraTransform.rotation * direction;
        moveDirection = new Vector3(movedis.x, 0, movedis.z);
    }
}