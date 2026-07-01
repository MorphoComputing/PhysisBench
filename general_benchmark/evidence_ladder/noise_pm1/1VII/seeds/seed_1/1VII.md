# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.857 A
- tm_score_ca_ordered: 0.810675838246401
- heavy_atom_rmsd: 2.696 A
- sidechain_heavy_atom_rmsd: 3.353 A
- **all-atom quality (honest):** heavy 2.696 A, sidechain 3.353 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.637

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8566602972775905
- ga_delta_rmsd: 2.0165329391450433  ga_fitness_mode: energy
- pre_local_rmsd: 0.8567015950439488  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K7 → 4 conflicts (57%); G33-L34 → 3 conflicts (43%)
- explained: 7/7 conflicts by 2 root cause(s)
- metrics: hubs=5 (frac 0.147), conflicts/hub=1.4, max_incompat=3.55Å, chain_span=0.765
- **fix-first:** [LOW_CONFLICT] Root cause(s): K7 + G33-L34 — explain ~7/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L28** — severity 2.37, 2 conflict(s); suspect input ~`K7` (group: push_out)
  - push-out (wants farther): K7@16.3Å(now 13.8,conf 0.35)
  - F10↔K7: targets 6.5/16.3Å but partners are 6.3Å apart → too_close_together by 3.5Å
  - V9↔K7: targets 7.8/16.3Å but partners are 5.2Å apart → too_close_together by 3.3Å
- **K7** — severity 2.04, 2 conflict(s); suspect input ~`S15` (group: push_out)
  - push-out (wants farther): L28@16.3Å(now 13.8,conf 0.35), S15@14.2Å(now 11.2,conf 0.34)
  - T13↔S15: targets 6.3/14.2Å but partners are 4.5Å apart → too_close_together by 3.4Å
  - F10↔L28: targets 6.2/16.3Å but partners are 7.6Å apart → too_close_together by 2.6Å
- **R14** — severity 0.94, 1 conflict(s); suspect input ~`L34` (group: pull_in)
  - pull-in (wants closer): G33@6.8Å(now 9.4,conf 0.38)
  - G33↔L34: targets 6.8/13.2Å but partners are 3.6Å apart → too_close_together by 2.8Å
- **G33** — severity 0.91, 1 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): R14@6.8Å(now 9.4,conf 0.38), A16@10.6Å(now 13.4,conf 0.34)
  - R14↔S15: targets 6.8/13.7Å but partners are 4.2Å apart → too_close_together by 2.7Å
- **A16** — severity 0.62, 1 conflict(s); suspect input ~`G33` (group: pull_in)
  - pull-in (wants closer): G33@10.6Å(now 13.4,conf 0.34)
  - L34↔G33: targets 16.0/10.6Å but partners are 3.6Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=9 · 3-10(G)=6 · coil(C)=1

```
EEHGGHHGHHHEEHHEHHEGHGHHEGHHEHHEHC
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=8 · sheet=9
  - D3 ↔ K7  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - F17 ↔ P21  (helix)
  - K24 ↔ L28  (helix)
  - L1 ↔ M12  (sheet)
  - L1 ↔ T13  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - M12 ↔ N19  (sheet)
  - T13 ↔ N19  (sheet)
  - A16 ↔ Q25  (sheet)
  - N19 ↔ Q25  (sheet)
  - Q25 ↔ K32  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=107 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=16 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2176 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
