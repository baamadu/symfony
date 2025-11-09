<?php

namespace App\Controller;

use App\Entity\Smartphone;
use App\Form\SmartphoneType;
use App\Repository\SmartphoneRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SmartphoneController extends AbstractController
{
    // Route om alle smartphones weer te geven
    #[Route('/smartphone', name: 'app_smartphone')]
    public function index(SmartphoneRepository $smartphoneRepository): Response
    {
        // Haalt alle smartphones op uit de database
        $smartphones = $smartphoneRepository->findAll();

        // Geeft de lijst van smartphones door aan de view
        return $this->render('smartphone/index.html.twig', [
            'smartphones' => $smartphones,
        ]);
    }

    // Route om één specifieke smartphone te bekijken
    #[Route('/smartphone/{id}', name: 'app_view_smartphone')]
    public function view(SmartphoneRepository $smartphoneRepository, int $id): Response
    {
        // Zoekt de smartphone op basis van ID
        $smartphone = $smartphoneRepository->find($id);

        // Geeft de smartphone door aan de detailpagina
        return $this->render('smartphone/view.html.twig', [
            'smartphone' => $smartphone,
        ]);
    }

    // Route om een nieuwe smartphone toe te voegen
    #[Route('/smartphone-add', name: 'app_add_smartphone')]
    public function add(Request $request, EntityManagerInterface $entityManager): Response
    {
        // Maakt een formulier aan voor een nieuwe smartphone
        $form = $this->createForm(SmartphoneType::class);
        $form->handleRequest($request);

        // Controleert of het formulier is verzonden en geldig is
        if ($form->isSubmitted() && $form->isValid()) {
            $smartphone = $form->getData();

            // Slaat de nieuwe smartphone op in de database
            $entityManager->persist($smartphone);
            $entityManager->flush();

            // Succesmelding en redirect naar de lijstpagina
            $this->addFlash('success', 'Smartphone has been added');
            return $this->redirectToRoute('app_smartphone');
        }

        // Toont het formulier als het nog niet is verzonden
        return $this->render('smartphone/add.html.twig', [
            'form' => $form
        ]);
    }

    // Route om een bestaande smartphone te bewerken
    #[Route('/smartphone-update/{id}', name: 'app_update_smartphone')]
    public function update(Request $request, EntityManagerInterface $entityManager, int $id): Response
    {
        // Haalt de bestaande smartphone op uit de database
        $smartphone = $entityManager->getRepository(Smartphone::class)->find($id);

        // Maakt een formulier aan en vult het met bestaande data
        $form = $this->createForm(SmartphoneType::class, $smartphone);
        $form->handleRequest($request);

        // Controleert of het formulier correct is ingevuld
        if ($form->isSubmitted() && $form->isValid()) {
            $smartphone = $form->getData();

            // Past de smartphone aan in de database
            $entityManager->persist($smartphone);
            $entityManager->flush();

            // Succesmelding en redirect naar de lijstpagina
            $this->addFlash('success', 'Smartphone has been updated');
            return $this->redirectToRoute('app_smartphone');
        }

        // Toont het formulier als het nog niet is verzonden
        return $this->render('smartphone/update.html.twig', [
            'form' => $form
        ]);
    }

    // Route om een smartphone te verwijderen
    #[Route('/smartphone{id}', name: 'app_delete_smartphone')]
    public function delete(EntityManagerInterface $entityManager, int $id): Response
    {
        // Zoekt de smartphone op basis van ID
        $smartphone = $entityManager->getRepository(Smartphone::class)->find($id);

        // Verwijdert de smartphone uit de database
        $entityManager->remove($smartphone);
        $entityManager->flush();

        // Geeft een melding en gaat terug naar de lijst
        $this->addFlash('danger', 'Smartphone has been removed');
        return $this->redirectToRoute('app_smartphone');
    }
}
