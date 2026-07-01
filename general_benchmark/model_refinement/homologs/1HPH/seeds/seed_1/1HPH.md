# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.711 A
- tm_score_ca_ordered: 0.15006647998433648
- heavy_atom_rmsd: 7.264 A
- sidechain_heavy_atom_rmsd: 8.502 A
- **all-atom quality (honest):** heavy 7.264 A, sidechain 8.502 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 219
- bin_accuracy: 0.429

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.710693363409009
- ga_delta_rmsd: -0.05525859387201493  ga_fitness_mode: energy
- pre_local_rmsd: 5.710747010393828  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N9-L10 → 6 conflicts (75%)
- explained: 6/8 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.171), conflicts/hub=1.3, max_incompat=2.29Å, chain_span=0.714
- **fix-first:** [LOW_CONFLICT] Root cause(s): N9-L10 — explain ~6/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K26** — severity 1.95, 3 conflict(s); suspect input ~`W22` (group: push_out)
  - push-out (wants farther): I4@27.1Å(now 24.4,conf 0.87), Q5@25.9Å(now 23.3,conf 0.66), L10@22.9Å(now 19.5,conf 0.49), L14@19.4Å(now 16.6,conf 0.39)
  - L10↔W22: targets 22.9/6.7Å but partners are 14.4Å apart → too_close_together by 1.8Å
  - L14↔W22: targets 19.4/6.7Å but partners are 10.8Å apart → too_close_together by 1.8Å
  - L10↔E21: targets 22.9/9.4Å but partners are 11.8Å apart → too_close_together by 1.7Å
- **N9** — severity 0.84, 1 conflict(s); suspect input ~`D29` (group: push_out)
  - push-out (wants farther): N32@27.4Å(now 24.2,conf 0.95), H31@26.6Å(now 23.1,conf 0.76), Q5@7.3Å(now 4.6,conf 0.36), I4@9.3Å(now 6.3,conf 0.34), S2@11.9Å(now 9.0,conf 0.34), E3@12.2Å(now 9.5,conf 0.34)
  - H31↔D29: targets 26.6/24.2Å but partners are 0.8Å apart → too_close_together by 1.6Å
- **L14** — severity 0.79, 1 conflict(s); suspect input ~`I4` (group: push_out)
  - push-out (wants farther): K26@19.4Å(now 16.6,conf 0.39), I4@16.1Å(now 13.6,conf 0.35), W22@13.4Å(now 10.8,conf 0.34)
  - L10↔I4: targets 6.8/16.1Å but partners are 7.1Å apart → too_close_together by 2.3Å
- **S2** — severity 0.66, 1 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): W22@24.6Å(now 21.9,conf 0.55), R24@23.8Å(now 21.1,conf 0.52), E21@21.0Å(now 18.2,conf 0.44), N9@11.9Å(now 9.0,conf 0.34)
  - Q5↔N9: targets 5.4/11.9Å but partners are 4.6Å apart → too_close_together by 1.9Å
- **L27** — severity 0.57, 1 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): R24@6.6Å(now 9.2,conf 0.39)
  - push-out (wants farther): L10@25.2Å(now 21.7,conf 0.60), H31@7.3Å(now 3.2,conf 0.36)
  - L10↔E21: targets 25.2/11.8Å but partners are 11.8Å apart → too_close_together by 1.7Å
- **R24** — severity 0.54, 1 conflict(s); suspect input ~`H31` (group: pull_in)
  - pull-in (wants closer): L27@6.6Å(now 9.2,conf 0.39)
  - push-out (wants farther): E3@26.0Å(now 22.8,conf 0.68), S2@23.8Å(now 21.1,conf 0.52)
  - L27↔H31: targets 6.6/11.3Å but partners are 3.2Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=8 · 3-10(G)=4 · coil(C)=1

```
CEGHHHHHGHHHEHHHHEHHEHHHEGGHHHHEEHE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=12 · sheet=4
  - I4 ↔ H8  (helix)
  - L6 ↔ L10  (helix)
  - M7 ↔ G11  (helix)
  - H8 ↔ K12  (helix)
  - L10 ↔ L14  (helix)
  - G11 ↔ N15  (helix)
  - K12 ↔ S16  (helix)
  - N15 ↔ R19  (helix)
  - S16 ↔ V20  (helix)
  - V20 ↔ R24  (helix)
  - R24 ↔ Q28  (helix)
  - V30 ↔ V34  (helix)
  - H13 ↔ E18  (sheet)
  - H13 ↔ E21  (sheet)
  - K25 ↔ N32  (sheet)
  - K25 ↔ F33  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=107 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
