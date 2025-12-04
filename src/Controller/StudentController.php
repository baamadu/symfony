<?php

namespace App\Controller;

use App\Entity\Student;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class StudentController extends AbstractController
{
    #[Route('/student', name: 'app_student')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $students = $entityManager->getRepository(Student::class)->findAll();
        return $this->render('student/index.html.twig', [
            'students' => $students,
        ]);
    }

    #[Route('/student/{id}', name: 'app_show_student')]
    public function showStudent(EntityManagerInterface $entityManager, int $id): Response
    {
        $student = $entityManager->getRepository(Student::class)->find($id);
        return $this->render('student/show-student.html.twig', [
            'student' => $student,
        ]);
    }
}
