# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_8\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 2.624 A
- tm_score_ca_ordered: 0.6351151507159939
- heavy_atom_rmsd: 4.038 A
- sidechain_heavy_atom_rmsd: 4.911 A
- **all-atom quality (honest):** heavy 4.038 A, sidechain 4.911 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 474
- bin_accuracy: 0.677

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6238223252122923
- ga_delta_rmsd: 2.5625589398822157  ga_fitness_mode: energy
- pre_local_rmsd: 2.6461087074939624  localized_anchor_rmsd: 2.6237703671540307

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E1 → 12 conflicts (75%)
- explained: 12/16 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.127), conflicts/hub=2.3, max_incompat=5.43Å, chain_span=0.655
- **fix-first:** [LOW_CONFLICT] Root cause(s): E1 — explain ~12/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y7** — severity 10.38, 3 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): E1@19.0Å(now 12.1,conf 0.99)
  - L4↔E1: targets 9.0/19.0Å but partners are 4.6Å apart → too_close_together by 5.4Å
  - E1↔K21: targets 19.0/4.5Å but partners are 9.5Å apart → too_close_together by 5.0Å
  - E1↔D23: targets 19.0/8.9Å but partners are 6.4Å apart → too_close_together by 3.7Å
- **D8** — severity 7.63, 3 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): L2@17.0Å(now 14.1,conf 1.00), E1@20.0Å(now 13.8,conf 0.72)
  - A5↔E1: targets 7.0/20.0Å but partners are 8.1Å apart → too_close_together by 4.9Å
  - E1↔L4: targets 20.0/11.0Å but partners are 4.6Å apart → too_close_together by 4.4Å
  - L2↔A5: targets 17.0/7.0Å but partners are 8.3Å apart → too_close_together by 1.7Å
- **Q10** — severity 5.09, 4 conflict(s); suspect input ~`E1` (group: push_out)
  - pull-in (wants closer): A50@14.2Å(now 17.5,conf 0.55), A49@14.0Å(now 16.8,conf 0.55)
  - push-out (wants farther): E1@21.8Å(now 18.4,conf 0.62)
  - L4↔E1: targets 15.0/21.8Å but partners are 4.6Å apart → too_close_together by 2.2Å
  - E1↔D23: targets 21.8/12.9Å but partners are 6.4Å apart → too_close_together by 2.4Å
  - E1↔K20: targets 21.8/8.3Å but partners are 11.1Å apart → too_close_together by 2.3Å
- **M19** — severity 3.01, 3 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): E1@16.6Å(now 13.1,conf 0.55)
  - D23↔E1: targets 8.0/16.6Å but partners are 6.4Å apart → too_close_together by 2.2Å
  - G22↔E1: targets 9.0/16.6Å but partners are 5.8Å apart → too_close_together by 1.8Å
  - A5↔E1: targets 7.0/16.6Å but partners are 8.1Å apart → too_close_together by 1.5Å
- **E16** — severity 1.76, 1 conflict(s); suspect input ~`D34` (group: pull_in)
  - pull-in (wants closer): D34@12.6Å(now 16.1,conf 0.55)
  - S13↔D34: targets 5.4/12.6Å but partners are 21.3Å apart → too_far_apart by 3.2Å
- **K21** — severity 0.93, 1 conflict(s); suspect input ~`L2` (group: push_out)
  - push-out (wants farther): L2@14.2Å(now 10.8,conf 0.55)
  - L4↔L2: targets 8.0/14.2Å but partners are 4.5Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=26 · 3-10(G)=9 · coil(C)=8

```
ECHGEHECEEECEEGEECEEGCEEEECCEGHEEHEGGEHGHHHEHHHEEGHEEGC
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=3 · sheet=67
  - E39 ↔ R43  (helix)
  - R43 ↔ V47  (helix)
  - V47 ↔ Y51  (helix)
  - E1 ↔ Y7  (sheet)
  - E1 ↔ K20  (sheet)
  - A5 ↔ Q10  (sheet)
  - A5 ↔ M19  (sheet)
  - A5 ↔ K20  (sheet)
  - A5 ↔ D23  (sheet)
  - A5 ↔ I24  (sheet)
  - A5 ↔ L25  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y7 ↔ I24  (sheet)
  - Y7 ↔ L25  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=228 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=146 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3617 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
