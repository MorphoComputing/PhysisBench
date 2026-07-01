# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1MSI\seeds\seed_0\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.497 A
- tm_score_ca_ordered: 0.9688468562133025
- heavy_atom_rmsd: 2.748 A
- sidechain_heavy_atom_rmsd: 3.582 A
- **all-atom quality (honest):** heavy 2.748 A, sidechain 3.582 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1891
- bin_accuracy: 0.653

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.49707371410633505
- ga_delta_rmsd: 0.09785248421233372  ga_fitness_mode: energy
- pre_local_rmsd: 0.5074042683712489  localized_anchor_rmsd: 0.49707190330317347

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P33-E35 → 21 conflicts (52%); T18 → 7 conflicts (18%); A1 → 5 conflicts (12%)
- explained: 33/40 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.266), conflicts/hub=2.4, max_incompat=3.57Å, chain_span=0.969
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P33-E35 + T18 + A1 — explain ~33/40 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E35** — severity 5.36, 6 conflict(s); suspect input ~`M22` (group: push_out)
  - pull-in (wants closer): M22@8.5Å(now 11.6,conf 0.35)
  - push-out (wants farther): P57@15.7Å(now 13.1,conf 0.34)
  - Q9↔M22: targets 19.6/8.5Å but partners are 7.8Å apart → too_close_together by 3.4Å
  - L51↔M22: targets 20.3/8.5Å but partners are 9.1Å apart → too_close_together by 2.8Å
  - P57↔I32: targets 15.7/6.6Å but partners are 6.3Å apart → too_close_together by 2.8Å
- **M22** — severity 5.36, 6 conflict(s); suspect input ~`E35` (group: pull_in)
  - pull-in (wants closer): E35@8.5Å(now 11.6,conf 0.35)
  - E35↔L10: targets 8.5/8.9Å but partners are 20.9Å apart → too_far_apart by 3.5Å
  - E35↔Q9: targets 8.5/7.4Å but partners are 19.3Å apart → too_far_apart by 3.5Å
  - N8↔E35: targets 5.1/8.5Å but partners are 16.0Å apart → too_far_apart by 2.5Å
- **A1** — severity 4.46, 5 conflict(s); suspect input ~`P33` (group: pull_in)
  - pull-in (wants closer): P33@8.7Å(now 11.5,conf 0.35)
  - push-out (wants farther): N8@21.2Å(now 18.6,conf 0.44)
  - N8↔E25: targets 21.2/7.7Å but partners are 10.4Å apart → too_close_together by 3.2Å
  - G62↔P33: targets 26.8/8.7Å but partners are 15.2Å apart → too_close_together by 2.9Å
  - N8↔V26: targets 21.2/5.4Å but partners are 13.8Å apart → too_close_together by 2.1Å
- **P33** — severity 4.23, 5 conflict(s); suspect input ~`K61` (group: pull_in)
  - pull-in (wants closer): A1@8.7Å(now 11.5,conf 0.35)
  - A1↔K61: targets 8.7/14.1Å but partners are 26.4Å apart → too_far_apart by 3.6Å
  - A1↔G62: targets 8.7/14.8Å but partners are 26.4Å apart → too_far_apart by 2.9Å
  - V60↔A1: targets 12.0/8.7Å but partners are 23.1Å apart → too_far_apart by 2.4Å
- **N8** — severity 2.08, 3 conflict(s); suspect input ~`A3` (group: push_out)
  - push-out (wants farther): A1@21.2Å(now 18.6,conf 0.44)
  - A1↔A3: targets 21.2/12.8Å but partners are 6.1Å apart → too_close_together by 2.4Å
  - A1↔E25: targets 21.2/11.2Å but partners are 8.2Å apart → too_close_together by 1.9Å
  - A1↔S24: targets 21.2/8.5Å but partners are 10.9Å apart → too_close_together by 1.8Å
- **T18** — severity 2.03, 2 conflict(s); suspect input ~`R23` (group: pull_in)
  - pull-in (wants closer): N46@12.6Å(now 15.3,conf 0.34)
  - push-out (wants farther): R23@13.1Å(now 10.1,conf 0.34), A34@16.4Å(now 13.8,conf 0.35)
  - M22↔R23: targets 5.8/13.1Å but partners are 3.8Å apart → too_close_together by 3.5Å
  - I37↔A34: targets 8.4/16.4Å but partners are 5.6Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=22 · 3-10(G)=17 · coil(C)=8

```
CEGGCGGHECGGEHEEEEHHHCEEEGEEGCEECHHHHHHHEHEEGHECGGGHEGGGHHCEGGEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=4 · sheet=20
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - P38 ↔ S42  (helix)
  - S42 ↔ N46  (helix)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - L17 ↔ R23  (sheet)
  - T18 ↔ R23  (sheet)
  - R23 ↔ I32  (sheet)
  - R23 ↔ V41  (sheet)
  - S24 ↔ G31  (sheet)
  - S24 ↔ I32  (sheet)
  - E25 ↔ G31  (sheet)
  - E25 ↔ I32  (sheet)
  - V27 ↔ I32  (sheet)
  - V41 ↔ V60  (sheet)
  - M43 ↔ V60  (sheet)
  - M43 ↔ Y63  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=142 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1791 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
